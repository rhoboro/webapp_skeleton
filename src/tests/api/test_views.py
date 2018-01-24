import json
import unittest

import pytest

from server import app


@pytest.mark.api
class ApiTestCase(unittest.TestCase):
    def setUp(self):
        app.testing = True
        self.app = app.test_client()

    def test_index_api(self):
        expected = {
            'message': 'Hello world'
        }
        response = self.app.get('/api/index')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(json.loads(response.get_data(as_text=True)), expected)
