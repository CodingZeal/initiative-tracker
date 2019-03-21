unless User.find_by(email: 'adam@codingzeal.com')
	User.create(
		[{email: 'adam@codingzeal.com',
		password: 'password',
		is_admin: true,
		fullname: 'Adam Cuppy'},

		{email: 'testa@testing.com',
		password: 'password',
		is_admin: false,
		fullname: 'testa'}]
		
	)
end
