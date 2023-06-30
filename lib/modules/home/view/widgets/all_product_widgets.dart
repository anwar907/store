import 'package:client/client.dart';
import 'package:flutter/material.dart';
import 'package:store/modules/home/view/widgets/form_product_widgets.dart';

class AllProductWidgets extends StatelessWidget {
  const AllProductWidgets({super.key, this.allProduct});

  final List<Product>? allProduct;

  @override
  Widget build(BuildContext context) {
    final allDataProduct = allProduct ?? [];
    return Center(
      child: Wrap(
        spacing: 20,
        alignment: WrapAlignment.spaceEvenly,
        children: allDataProduct
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
                    width: 150,
                    height: 100,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(e.name ?? ''),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
