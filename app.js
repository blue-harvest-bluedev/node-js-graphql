const createApolloServer = require("./src/apolloServer.js");
const {APPLICATION_NAME} = require("./src/constants");
// The `listen` method launches a web server.
createApolloServer().listen().then(({url}) => {
    console.log(`🚀 ${APPLICATION_NAME} Server ready at ${url}`);
});

