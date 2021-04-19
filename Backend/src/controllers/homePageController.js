//GET OUR HOMEPAGE
let handleHelloWorld = async (req, res) => {
    return res.send({ error: false, message: "Homepage"},{
        user: req.user
    });
};

module.exports = {
    handleHelloWorld: handleHelloWorld,
};
