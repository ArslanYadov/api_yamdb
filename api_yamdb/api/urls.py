from django.urls import include, path
from rest_framework.routers import DefaultRouter

from api.views import TitleViewSet, GenreViewSet, CategoryViewSet


router = DefaultRouter()
router.register('categories', CategoryViewSet, basename='category')
router.register('genres', GenreViewSet, basename='genre')
router.register('titles', TitleViewSet, basename='title')

urlpatterns = [
    path('v1/', include(router.urls)),
]
