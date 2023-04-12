from flask import Flask, Blueprint, render_template, request, flash
import uuid


def create_app():
    # Create Flask App
    app = Flask(__name__)
    app.config['SECRET_KEY'] = str(uuid.uuid4().hex)    

    # Blueprints
    from main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    # Return Flask App
    return app


if __name__ == '__main__':
    app = create_app()
    app.run(host='0.0.0.0', port=5050)