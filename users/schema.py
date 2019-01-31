import graphene
from graphene_django.types import DjangoObjectType
from users.models import User
from graphql import GraphQLError
from graphql_jwt.decorators import login_required

class UserType(DjangoObjectType):
  class Meta:
    model = User
    exclude_fields = ('password')

class Query(graphene.ObjectType):
  user = graphene.Field(
    UserType,
    description='Return Current User\'s Information'
  )

  @login_required
  def resolve_user(self, info):
    return info.context.user



class SignUp(graphene.Mutation):
  class Arguments:
    email = graphene.String(required=True)
    password = graphene.String(required=True)

  user = graphene.Field(UserType)

  def mutate(self, info, email, password):
    try:
      user = User.objects.create_user(email, email, password)
      user.save()
      return SignUp(user)
    except:
      raise GraphQLError('Something went wrong while creating user')

class Mutation(graphene.ObjectType):
  signup = SignUp.Field()


