from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth.models import Group


class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    def create(self, validated_data):
        user = User.objects.create(
            username=validated_data['username']
        )
        user.set_password(validated_data['password'])
        user.save()
        user_group = Group.objects.get(name='especialistas_usuarios')
        user_group.user_set.add(user)
        return user

    class Meta:
        model = User
        fields = ('id', 'username', 'password', 'is_active')
