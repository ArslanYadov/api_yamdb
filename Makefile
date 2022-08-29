VENV_PATH='venv/bin/activate'
ENVIRONMENT_VARIABLE_FILE='.venv'
MANAGE_PATH='./api_yamdb'

define find.functions
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
endef

help: ## вывод доступных команд
	@echo 'The following commands can be used.'
	@echo ''
	$(call find.functions)

setup: ## выполнить команды venv install init run
setup: venv install init run

venv: ## установка и активация виртуального окружения
venv:
	python3 -m venv venv
	source $(VENV_PATH)
	source $(ENVIRONMENT_VARIABLE_FILE)

install: ## установка/обновление pip
install:
	python -m pip install --upgrade pip

init: ## установка зависимостей из requirements.txt
init:
	pip install -r requirements.txt

run: ## выполнить миграции и запустить сервер
run:
	cd $(MANAGE_PATH); python manage.py migrate
	cd $(MANAGE_PATH); python manage.py runserver

leave: ## очистка и деактивация виртуального окружения
leave: clean
	deactivate

clean: ## очистка кэша
clean:
	find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
