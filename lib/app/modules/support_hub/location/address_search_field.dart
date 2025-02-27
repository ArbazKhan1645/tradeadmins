// ignore_for_file: unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nominatim_flutter/model/request/search_request.dart';
import 'package:nominatim_flutter/nominatim_flutter.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:partner_hub/app/modules/support_hub/location/place_model.dart';

class AddressSearchField extends StatefulWidget {
  final Function(Place)? onAddressSelected;
  final TextEditingController? zipCodeController;
  final TextEditingController? formControl;
  bool isRequired;

  AddressSearchField({
    super.key,
    this.formControl,
    this.isRequired = true,
    this.onAddressSelected,
    this.zipCodeController,
  });

  @override
  _AddressSearchFieldState createState() => _AddressSearchFieldState();
}

class _AddressSearchFieldState extends State<AddressSearchField> {
  List<Place> _searchResults = [];
  bool _searching = false;
  bool _isButtonLoading = false;
  Timer? _debounce;
  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    widget.zipCodeController!.text = widget.formControl!.text;
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    if (_overlayEntry?.mounted ?? false) {
      _overlayEntry?.remove();
    }
    _overlayEntry = null; // Prevent future use after disposal
    super.dispose();
  }

  Future<Map<String, String?>?> reverseGeocodeIsolate(
      double latitude, double longitude) async {
    return await compute(reverseGeocode, [latitude, longitude]);
  }

  static Future<Map<String, String?>?> reverseGeocode(
      List<dynamic> args) async {
    double latitude = args[0];
    double longitude = args[1];
    const apiKey = '6620f2de02536660197180fjy72c00b';
    final url =
        'https://geocode.maps.co/reverse?lat=$latitude&lon=$longitude&api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse is Map<String, dynamic>) {
          String? city = jsonResponse['address']['city'];
          String? country = jsonResponse['address']['country'];
          String? street = jsonResponse['address']['road'];
          String? zipCode = jsonResponse['address']['postcode'];
          String? state = jsonResponse['address']['state'];

          return {
            'city': city,
            'country': country,
            'street': street,
            'zipCode': zipCode,
            'state': state,
          };
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error performing reverse geocoding: $e');
      }
    }
    return null;
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        _performSearch();
      }
    });
  }

  Future<void> _performSearch() async {
    String query = widget.zipCodeController!.text.trim();
    List<Place> places = [];

    if (query.isEmpty) {
      setState(() {
        _searchResults.clear();
      });
      return;
    }

    setState(() {
      _searching = true;
      _isButtonLoading = true;
    });

    try {
      final searchRequest = SearchRequest(
        query: query,
        limit: 5,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );

      final searchResult = await NominatimFlutter.instance.search(
        searchRequest: searchRequest,
        language: 'en-US',
      );

      for (var result in searchResult) {
        double latitude = double.parse(result.lat ?? '0');
        double longitude = double.parse(result.lon ?? '0');

        var reverseResult = await reverseGeocodeIsolate(latitude, longitude);
        if (reverseResult != null) {
          Place place = Place(
            city: reverseResult['city'],
            country: reverseResult['country'],
            street: reverseResult['street'],
            zipCode: reverseResult['zipCode'],
            lat: latitude,
            lng: longitude,
          );
          places.add(place);
        }
      }

      setState(() {
        _searchResults = places;
        _searching = false;
        _isButtonLoading = false;
      });

      if (_searchResults.isNotEmpty) {
        _showOverlay();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error searching addresses: $e');
      }
      setState(() {
        _searchResults.clear();
        _searching = false;
        _isButtonLoading = false;
      });
    }
  }

 void _showOverlay() {
  final overlay = Overlay.of(context); // Ensure overlay is available

  final renderBox = context.findRenderObject() as RenderBox?;
  if (renderBox != null) {
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (_overlayEntry?.mounted ?? false) {
                _overlayEntry?.remove();
              }
              setState(() {
                _searchResults.clear();
              });
            },
            child: Container(color: Colors.transparent),
          ),
          Positioned(
            top: offset.dy + size.height,
            left: offset.dx,
            width: size.width,
            child: Material(
              color: Colors.transparent,
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        Container(color: Colors.grey, height: 1),
                    shrinkWrap: true,
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      Place place = _searchResults[index];
                      return ListTile(
                        dense: true,
                        title: Text(place.city ?? ''),
                        subtitle: Text(
                            '${place.street ?? ''}, ${place.country ?? ''}'),
                        onTap: () {
                          widget.onAddressSelected?.call(place);
                          widget.formControl?.text = place.zipCode ?? '';
                          widget.zipCodeController?.text = place.zipCode ?? '';
                          setState(() {
                            _searchResults.clear();
                          });

                          if (_overlayEntry?.mounted ?? false) {
                            _overlayEntry?.remove();
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_overlayEntry!);
  }
}

  Widget _buildSearchField() {
    return TextFormField(
      controller: widget.zipCodeController,
      validator: widget.isRequired
          ? (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid postal or zip code';
              }
              return null;
            }
          : null,
      onChanged: (value) {},
      decoration: InputDecoration(
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        contentPadding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
        prefixIcon: widget.zipCodeController!.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  widget.zipCodeController!.clear();
                  setState(() {
                    _searchResults.clear();
                  });
                  _overlayEntry?.remove(); // Remove overlay when cleared
                },
              )
            : const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: _isButtonLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                )
              : MaterialButton(
                  onPressed: _isButtonLoading
                      ? null
                      : () {
                          _onSearchChanged(widget.zipCodeController!.text);
                        },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(9)),
                    child: Center(
                      child:
                          Text('Search', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
          onPressed: _isButtonLoading
              ? null
              : () {
                  _onSearchChanged(widget.zipCodeController!.text);
                },
        ),
        hintText: 'Enter Post or zip code',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black38, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff2f68c0), width: 1),
        ),
        labelText: 'Post Code',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSearchField();
  }
}
