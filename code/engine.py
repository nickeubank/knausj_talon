from talon import Context, Module
from talon import speech_system

# from talon.engines.w2l import W2lEngine

# w2l = W2lEngine(model="en_US-conformer", debug=False)
# speech_system.add_engine(w2l)

mod = Module()


@mod.action_class
class Actions:
    def engine_sleep():
        """Sleep the engine"""
        speech_system.engine_mimic("go to sleep"),

    def engine_wake():
        """Wake the engine"""
        speech_system.engine_mimic("wake up"),

    def engine_mimic(cmd: str):
        """Sends phrase to engine"""
        speech_system.engine_mimic(cmd)
