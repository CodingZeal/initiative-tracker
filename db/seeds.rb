unless User.find_by(email: 'adam@codingzeal.com')
	User.create(
		{email: 'adam@codingzeal.com',
		password: 'password',
		is_admin: true,
		fullname: 'Adam Cuppy'}
	)
end
