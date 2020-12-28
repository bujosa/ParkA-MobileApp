import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/review/review_data_model.dart';
import 'package:ParkA/data/dtos/reservation/create_reservation_dto.dart';
import 'package:ParkA/pages/create-reservation/utils/generate_schedule_util.dart';
import 'package:ParkA/utils/graphql/mutations/reservation_mutation.dart';
import 'package:ParkA/utils/graphql/queries/review_queries.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class ReviewUseCases {
  static Future<bool> createReview(
      CreateReservationDto _createReservationDto) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    final Map<String, dynamic> createReservationInput = {
      "data": {
        "parking": _createReservationDto.parking.id,
        "owner": _createReservationDto.parking.user.id,
        "checkInDate": _createReservationDto.checkInDate,
        "checkOutDate": _createReservationDto.checkOutDate,
        "vehicle": _createReservationDto.vehicle.id,
        "paymentInfo": _createReservationDto.paymentInfo.id,
        "total": _createReservationDto.total,
        "rentDate": formatDate(_createReservationDto.rentDate),
      }
    };

    final options = MutationOptions(
        variables: createReservationInput,
        documentNode: gql(createReservationMutation));

    final _result = await graphqlClient.mutate(options);

    if (_result.data != null) {
      return true;
    }

    return false;
  }

  static Future<Review> getReviewByReservation(id) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    final data = {
      "data": {
        "id": id,
      }
    };

    QueryOptions _queryOptions = new QueryOptions(
        documentNode: gql(getReviewByReservationQuery), variables: data);

    final _result = await graphqlClient.query(_queryOptions);

    if (_result.data != null) {
      final review = _result.data['getReviewByReservation'];

      final Review reviewData = Review.reviewFromJson(review);

      return reviewData;
    }
    return null;
  }
}
