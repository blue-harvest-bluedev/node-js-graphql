const {createTestClient} = require('apollo-server-testing');
const createApolloServer = require("../src/apolloServer.js");
const {APPLICATION_NAME} = require("../src/constants");

test('get ServerName', async () => {
    // create a new instance of our server (not listening on any port)
    const {query} = createTestClient(createApolloServer());
    // graphl query
    const getServerName = `
        {
            serverName
        }`;

    const response = await query({query: getServerName});
    expect(response.data.serverName).toEqual(APPLICATION_NAME + ' Apollo Server');
});
