module.exports = (req, res, next) => {
  const user = req.session.passport;
  if (!user) res.sendStatus(401);
  return next();
};
