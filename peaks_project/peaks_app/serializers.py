from rest_framework import serializers
from .models import Peak

class PeakSerializer(serializers.ModelSerializer):
    class Meta:
        model = Peak
        fields = '__all__'

