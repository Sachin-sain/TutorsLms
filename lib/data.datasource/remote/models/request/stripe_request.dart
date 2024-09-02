import 'dart:convert';

String stripeRequestToJson(StripeRequest data) => json.encode(data.toJson());

class StripeRequest {
  final String packageId;

  StripeRequest({
    required this.packageId,
  });

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
  };
}