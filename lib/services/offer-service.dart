import 'package:dio/dio.dart';
import 'package:fudiko/api/dio_client.dart';
import 'package:fudiko/models/offer/offer-create-model.dart';
import 'package:fudiko/models/offer/offer-list-model.dart';
import 'package:fudiko/models/offer/offer-return-model.dart';
import 'package:fudiko/models/offer/offer-status-change-model.dart';
import 'package:fudiko/utils/tokens.dart';

class OfferService {
  Future<OfferReturnModel> createOffer(CreateOfferModel offer) async {
    final token = await getToken();
    try {
      final response = await DioClient.dio.post(
        '/partner/offers/create',
        data: offer.toFormData(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return OfferReturnModel.fromJson(response.data);
      } else {
        return OfferReturnModel(
          status: false,
          message: 'Offer creation failed: ${response.statusCode}',
        );
      }
    } catch (e) {
      return OfferReturnModel(
        status: false,
        message: 'Something went wrong: $e',
      );
    }
  }

  Future<OfferListResponse> getAllOffers() async {
    final token = await getToken();
    try {
      final response = await DioClient.dio.get(
        '/partner/offers/all',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        print(response.data);
        return OfferListResponse.fromJson(response.data);
      } else {
        return OfferListResponse(status: false, offers: []);
      }
    } catch (e) {
      return OfferListResponse(status: false, offers: []);
    }
  }

  Future<OfferListResponse> getActiveOffers() async {
    final token = await getToken();
    try {
      final response = await DioClient.dio.get(
        '/partner/offers/active',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        print(response.data);
        return OfferListResponse.fromJson(response.data);
      } else {
        return OfferListResponse(status: false, offers: []);
      }
    } catch (e) {
      return OfferListResponse(status: false, offers: []);
    }
  }

  Future<OfferListResponse> getInActiveOffers() async {
    final token = await getToken();
    try {
      final response = await DioClient.dio.get(
        '/partner/offers/inactive',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        print(response.data);
        return OfferListResponse.fromJson(response.data);
      } else {
        return OfferListResponse(status: false, offers: []);
      }
    } catch (e) {
      return OfferListResponse(status: false, offers: []);
    }
  }

  Future<OfferStatusChangeReturnModel> changeStatus(OfferStatusChangeModel offer) async {
    final token = await getToken();
    try {
      final response = await DioClient.dio.post(
        '/partner/offers/update-status',
        data: offer.toFormData(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return OfferStatusChangeReturnModel.fromJson(response.data);
      } else {
        return OfferStatusChangeReturnModel(
          status: false,
          message: 'Offer status change failed: ${response.statusCode}',
        );
      }
    } catch (e) {
      return OfferStatusChangeReturnModel(
        status: false,
        message: 'Something went wrong: $e',
      );
    }
  }
}
