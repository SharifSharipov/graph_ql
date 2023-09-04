const getShips = r'''
  query GetShips() {
   ships{
        id
        name
        image
        status
        roles
        year_built
        type
    }
  }
''';
