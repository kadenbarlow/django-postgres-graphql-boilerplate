from django.test import TestCase
from graphene.test import Client
from server.schema import schema

class UserGraphQLTest(TestCase):
  def setUp(self):
    pass

  def tearDown(self):
    pass

  def test_sign_up(self):
    client = Client(schema)
    executed = client.execute('''
    mutation {
      signup(email:"testuser@test.com", password:"Password1") {
        user{
          isActive
          email
          isSuperuser
          isStaff
        }
      }
    }
    ''')
    assert executed['data']['signup']['user'] == {
      'isActive': True,
      'email': 'testuser1@test.com',
      'isSuperuser': False,
      'isStaff': False
    }