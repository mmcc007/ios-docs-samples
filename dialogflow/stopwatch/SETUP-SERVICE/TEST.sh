#!/bin/sh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


source $(dirname $0)/PROJECT.sh

# List intents.
echo "LIST INTENTS"
curl -H "Authorization: Bearer "$(gcloud auth print-access-token) \
     -H "Content-Type: application/json; charset=utf-8" \
     "$SERVICE/intents"
  
# Test "start stopwatch" command.
echo "START STOPWATCH"
curl -H "Authorization: Bearer "$(gcloud auth print-access-token) \
     -H "Content-Type: application/json; charset=utf-8" --data "{
  'query_input': {
    'text': {
      'text': 'start stopwatch',
      'language_code': 'en-US'
    }
  }
}" "$SERVICE/sessions/$SESSION:detectIntent"
  
# Test "stop stopwatch" command.
echo "STOP STOPWATCH"
curl -H "Authorization: Bearer "$(gcloud auth print-access-token) \
     -H "Content-Type: application/json; charset=utf-8" --data "{
  'query_input': {
    'text': {
      'text': 'stop stopwatch',
      'language_code': 'en-US'
    }
  }
}" "$SERVICE/sessions/$SESSION:detectIntent"
  
