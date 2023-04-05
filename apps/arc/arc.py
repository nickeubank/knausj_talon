from talon import ctrl, ui, Module, Context, actions, clip, app

ctx = Context()
mod = Module()
apps = mod.apps
apps.arc = "app.name: Arc"
apps.arc = "app.name: arc"
apps.arc = """
"""
apps.arc = """
os: mac
"""

ctx.matches = r"""
app: arc
"""


@ctx.action_class("browser")
class BrowserActions:
    # TODO
    # action(browser.address):
    # action(browser.title):
    def go(url: str):
        actions.browser.focus_address()
        actions.sleep("50ms")
        actions.insert(url)
        actions.key("enter")

    def focus_search():
        actions.browser.focus_address()

    def submit_form():
        actions.key("enter")
