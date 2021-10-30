from django.conf import settings
from django.contrib import admin
from django.views.generic import TemplateView
from django.urls import include, path
from django.conf.urls import url
from rest_framework.documentation import include_docs_urls
from rest_framework_swagger.views import get_swagger_view
from rest_framework.schemas import get_schema_view
from rest_framework_swagger.renderers import SwaggerUIRenderer, OpenAPIRenderer

from peaks_project.peaks_app.views import home

urlpatterns = [
    url(r'^$', home, name='home'),
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls')),
    path('api/peaks/', include('peaks_project.peaks_app.urls')),

    path('docs/', TemplateView.as_view(template_name='swagger-ui.html',
                                       extra_context={'schema_url': 'openapi-schema'}),
         name='swagger-ui'),
    url(r'^openapi-schema', get_schema_view(title='Peaks App Swagger API',
                                            renderer_classes=[OpenAPIRenderer, SwaggerUIRenderer],
                                            version="1.0.0", public=True),
        name='openapi-schema'),

    url(r'^docs_v2/', include_docs_urls(title='Peaks App Native API'))
]
