users = User.create([
                     {
                       email: '123@123.com',
                       name: '123',
                       activated: DateTime.now,
                       admin: false
                     },
                     {
                       email: '234@234.com',
                       name: '234',
                       activated: DateTime.now,
                       admin: false
                     }
                    ])
