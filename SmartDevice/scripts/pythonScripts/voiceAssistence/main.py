#!/usr/bin/env python3

from os import environ

try:
    # NOTE: this example requires PyAudio because it uses the Microphone class
    import wave
    import pyaudio
    import speech_recognition as sr

    environ['PYTHONUNBUFFERED'] = "1"

    sample_rate = 44100  # 44.1kHz sampling rate
    chunk = 4096  # 2^12 samples for buffer
    record_secs = 3  # seconds to record
    # dev_index = 5  # device index found by p.get_device_info_by_index(ii)
    dev_index = None  # device index found by p.get_device_info_by_index(ii)
    phrase_time_limit = 5
    wav_output_filename = 'test1.wav'  # name of .wav file

    def show_devices():
        p = pyaudio.PyAudio()
        print()
        for ii in range(p.get_device_count()):
            print(p.get_device_info_by_index(ii).get('name'))


    def google_recognition(r, audio):
        try:
            print("google thinks you said: " + r.recognize_google(audio))
        except sr.UnknownValueError:
            print("google could not understand audio")
        except sr.RequestError as ed:
            print("google error; {0}".format(ed))


    def sphinx_recognition(r, audio):
        # recognize speech using Sphinx
        try:
            speech_text = r.recognize_sphinx(audio)
            print("Sphinx thinks you said: " + speech_text)
        except sr.UnknownValueError:
            print("Sphinx could not understand audio")
        except sr.RequestError as e:
            print("Sphinx error; {0}".format(e))
        exit()


    def audio_to_text():
        print("The end")
        print()
        # obtain audio from the microphone
        r = sr.Recognizer()

        with sr.AudioFile(wav_output_filename) as source:
            print("Say something!")
            audio = r.listen(source)

        # obtain audio from the microphone
        #
        print("Next line")

        print("google recognition")
        google_recognition(r, audio)
        print("sphinx recognition")
        sphinx_recognition(r, audio)
        print()
        print("Continue")


    def audio_to_text_microphone():
        print("The start")
        print()
        # obtain audio from the microphone
        r = sr.Recognizer()
        print("After recognizer")
        with sr.Microphone(dev_index, sample_rate, chunk) as source:
            r.adjust_for_ambient_noise(source)
            print("Say something!")
            audio = r.listen(source, record_secs, phrase_time_limit)
            # with open('speech.wav', 'wb') as f:
            #     f.write(audio.get_wav_data())

        # obtain audio from the microphone
        #
        print("Next line")

        print("google recognition")
        google_recognition(r, audio)
        print("sphinx recognition")
        sphinx_recognition(r, audio)

    print("Start now")
    while True:
        print("Now record")
        # record()
        audio_to_text_microphone()
        print("Now recogniseing")
        # audio_to_text()


except Exception as e:
    print("This is python exeption: " + str(e))
