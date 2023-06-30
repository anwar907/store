import 'package:client/client.dart';
import 'package:flutter/material.dart';
import 'package:store/modules/home/view/widgets/form_product_widgets.dart';

class BestProductWidget extends StatelessWidget {
  const BestProductWidget({super.key, this.bestProduct});

  final List<Product>? bestProduct;

  @override
  Widget build(BuildContext context) {
    final dataProduct = bestProduct ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Best Product'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: dataProduct
                .map(
                  (e) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => FormProductWidgets(product: e),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 150,
                        height: 100,
                        child: Center(
                          child: Text(e.name ?? ''),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
