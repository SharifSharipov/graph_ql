import 'package:graph_ql/data/models/ships.dart';
import 'package:graph_ql/data/network/queries/queries.dart' as q;
import 'package:graphql/client.dart';

class GetShipsRequestFailure implements Exception {}

class ShipsApiClient {
  const ShipsApiClient({required this.graphQLClient});

  factory ShipsApiClient.create() {
    final httpLink = HttpLink('https://spacex-production.up.railway.app/');
    final link = Link.from([httpLink]);

    return ShipsApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient graphQLClient;

  Future<List<Ship>> getShips() async {
    final result = await graphQLClient.query(
      QueryOptions(document: gql(q.getShips)),
    );

    if (result.hasException) throw GetShipsRequestFailure();
    return (result.data?['countries'] as List?)
        ?.map((dynamic e) => Ship.fromJson(e as Map<String, dynamic>))
        .toList() ??
        [];
  }

  Future<Ship> getShipById(String id) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(q.getShipById),
        variables: {'id': id},
      ),
    );
    final data =  result.data as Map<String, dynamic>;
    return Ship.fromJson(data);
  }
}