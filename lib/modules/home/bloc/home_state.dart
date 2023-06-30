part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.productModels,
      this.status = GlobalStatusState.initial,
      this.message,
      this.product,});
  final ProductModels? productModels;
  final GlobalStatusState status;
  final String? message;
  final Product? product;

  HomeState copyWith({
    ProductModels? productModels,
    GlobalStatusState? status,
    String? message,
    Product? product,
  }) {
    return HomeState(
        productModels: productModels ?? this.productModels,
        status: status ?? this.status,
        message: message ?? this.message,
        product: product ?? this.product,);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productModels, status, message, product];
}
