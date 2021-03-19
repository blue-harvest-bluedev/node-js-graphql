const {APPLICATION_NAME} = require("./constants");
const {ApolloServer, gql} = require('apollo-server');

const typeDefs = gql`
  type Query {
    serverName: String
  }
`;

const resolvers = {
    Query: {
        serverName: () => APPLICATION_NAME + ' Apollo Server',
    },
};

// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
module.exports = function createApolloServer() {
    return new ApolloServer({typeDefs, resolvers});
};
