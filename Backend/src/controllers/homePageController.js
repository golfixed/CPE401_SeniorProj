//GET OUR HOMEPAGE
let handleHelloWorld = async (req, res) => {
    return res.status(200).send({ error: false, message: "Server connected"});
};
module.exports = {
    handleHelloWorld: handleHelloWorld
};
