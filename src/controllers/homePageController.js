//GET OUR HOMEPAGE
let handleHelloWorld = async (req, res) => {
    // return res.render("homepage.ejs",{
    //     user: req.user
    // });
    return res.send({ error: false, message: "Home Page"});
};

module.exports = {
    handleHelloWorld: handleHelloWorld,
};
