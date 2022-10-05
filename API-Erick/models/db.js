const Sequelize = require('sequelize');
const sequelize = new Sequelize("bucho",'root',"123456",{
	host: "localhost",
	dialect: 'mysql'
});
sequelize.authenticate()
	.then(() => {
		console.log('deu certo a conexão');
	}).catch(() => {
		console.log('erro de conexão');
	});

module.exports = sequelize;