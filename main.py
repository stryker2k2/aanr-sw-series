from flask import Flask, Blueprint, render_template, request, flash

main = Blueprint('main', __name__)

@main.route("/")
def mainpage():
    return render_template("main.html")