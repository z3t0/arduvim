import unittest
import arduvim as sut


@unittest.skip("Don't forget to test!")
class ArduvimTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.arduvim_example()
        self.assertEqual("Happy Hacking", result)
