import unittest
import Arduvim as sut


@unittest.skip("Don't forget to test!")
class ArduvimTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.Arduvim_example()
        self.assertEqual("Happy Hacking", result)
