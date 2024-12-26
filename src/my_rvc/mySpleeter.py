# @article{spleeter2020,
#   doi = {10.21105/joss.02154},
#   url = {https://doi.org/10.21105/joss.02154},
#   year = {2020},
#   publisher = {The Open Journal},
#   volume = {5},
#   number = {50},
#   pages = {2154},
#   author = {Romain Hennequin and Anis Khlif and Felix Voituret and Manuel Moussallam},
#   title = {Spleeter: a fast and efficient music source separation tool with pre-trained models},
#   journal = {Journal of Open Source Software},
#   note = {Deezer Research}
# }

from spleeter.separator import Separator
from spleeter.audio.adapter import AudioAdapter
import numpy as np

TEST_AUDIO_DESCRIPTORS = ["audio_example.mp3", "audio_example_mono.mp3"]
MODELS = ["spleeter:2stems", "spleeter:4stems", "spleeter:5stems"]

MODEL_TO_INST = {
    "spleeter:2stems": ("vocals", "accompaniment"),
    "spleeter:4stems": ("vocals", "drums", "bass", "other"),
    "spleeter:5stems": ("vocals", "drums", "bass", "piano", "other"),
}


def test_separate():
    """Test separation from raw data."""
    instruments = MODEL_TO_INST["spleeter:2stems"]
    adapter = AudioAdapter.default()
    waveform, _ = adapter.load("src/my_rvc/audio_example.mp3")
    separator = Separator("spleeter:2stems", multiprocess=False)
    prediction = separator.separate(waveform, "audio_example.mp3")
    assert len(prediction) == len(instruments)
    for instrument in instruments:
        assert instrument in prediction
    for instrument in instruments:
        track = prediction[instrument]
        assert waveform.shape[:-1] == track.shape[:-1]
        assert not np.allclose(waveform, track)
        for compared in instruments:
            if instrument != compared:
                assert not np.allclose(track, prediction[compared])

def main():
    import os

    # f = open("test.txt", 'w')

    # f.write("test")

    # f.close()

    # separator = Separator('spleeter:2stems')
    # separator.separate(waveform, lambda instrument, data: ...)
    # separator.separate_to_file(...)
    test_separate()
    
    print("test")

if __name__ == "__main__":
    main()