const getShipById = r'''
    query getShipById($id: String!) {
ship(id: $id) {
id
name
image
status
roles
year_built
type
}
}''';
