import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import '../../../../helper/constants.dart';
import '../../../../models/order_response_model.dart';

class Design extends StatelessWidget {
  final Datum orderDetails;

  const Design({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width * 0.9;
    final double containerHeight = MediaQuery.of(context).size.width * 1.35;

    return Center(
      child: Container(
        width: containerWidth,
        height: containerHeight,
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: kLightGreyColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: orderDetails.products.map((product) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Produk Yang Dibeli",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Image.network(
                        product.image,
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.width / 3.5,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            child: Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kBlackColor,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Size: ${product.size}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: kDarkGreyColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Quantity: ${product.quantity}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: kDarkGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Design Pelanggan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    orderDetails.image!.path,
                    width: MediaQuery.of(context).size.width / 1.25,
                    height: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        // Download the image from the network
                        var imageId = await ImageDownloader.downloadImage(orderDetails.image!.path);
                        if (imageId == null) {
                          return;
                        }
                        // Optionally, retrieve the file path
                        var filePath = await ImageDownloader.findPath(imageId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Image downloaded successfully: $filePath")),
                        );
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error downloading image: $error")),
                        );
                      }
                    },
                    icon: const Icon(Icons.download),
                    label: const Text("Download Image"),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
