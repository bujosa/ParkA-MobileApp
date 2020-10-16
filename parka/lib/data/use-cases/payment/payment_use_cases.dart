import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/payment/payment_data_model.dart';

import 'package:ParkA/data/use-cases/user/dtos/user_registration_dto.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class PaymentUseCases {
  static Future createPayment(CreatePaymentDto createPaymentDto) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;
    String createPaymentQuery = r"""
    mutation($data:CreatePaymentInput!){
      createPayment(createPaymentInput:$data){
        cardHolder
        expirationDate
        digit
        activated  
      }
    }
    """;

    print(createPaymentDto.cardHolder);
    print(createPaymentDto.card);
    print(createPaymentDto.expirationDate);
    print(createPaymentDto.cvv);
    print(createPaymentDto.digit);

    final createPaymentInput = {
      "data": {
        "cardHolder": createPaymentDto.cardHolder,
        "expirationDate": "2020-10-02T02:05:30.962Z",
        "digit": createPaymentDto.digit,
        "card": "",
        "cvv": createPaymentDto.cvv,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createPaymentQuery),
      variables: createPaymentInput,
    );

    final createPaymentInputResult =
        await graphqlClient.mutate(mutationOptions);

    print(createPaymentInputResult.data);
    print(createPaymentInputResult.exception);
    if (createPaymentInputResult.data != null) {
      print("created");
      return true;
    }

    return false;
  }

  static Future<List<Payment>> getAllUserPaymentMethods() async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    String getAllUserPaymentMethods = r""" 
    query{
      getUserInformationById{
        id
        paymentInformation{
          id
          cardHolder
          expirationDate
          digit
          activated
          
        }
      }
    }
    """;

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllUserPaymentMethods));

    final createPaymentInputResult = await graphqlClient.query(queryOptions);

    print(createPaymentInputResult.data);
    if (createPaymentInputResult.data != null) {
      return Payment.paymentsFromJson(createPaymentInputResult
          .data["getUserInformationById"]["paymentInformation"]);
    }

    return [];
  }
}
