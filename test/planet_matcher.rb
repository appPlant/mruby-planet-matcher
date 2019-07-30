# MIT License
#
# Copyright (c) 2019 Sebastian Katzer
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

class String
  def match_p?(planet)
    PlanetMatcher.new(self).match? planet
  end
end

assert 'PlanetMatcher#match?' do
  assert_true 'mars'.match_p?('id' => 'mars')
  assert_true 'id:.*'.match_p?('id' => 'mars')
  assert_true 'id:[a-z]+'.match_p?('id' => 'mars')
  assert_true 'id=mars'.match_p?('id' => 'mars')
  assert_false 'id:mars'.match_p?('id' => 'Mars')
  assert_false 'id:^mars$'.match_p?('id' => 'mars-id')
  assert_true 'id:^(?i)mars$'.match_p?('id' => 'MARS')
  assert_true 'location:leipzig'.match_p?('location' => ['leipzig', 'halle'])
  assert_false 'location:leipzig'.match_p?('location' => ['erfurt', 'halle'])
  assert_true 'location:leipzig$@env=prod'.match_p?('location' => 'leipzig', 'env' => 'prod')
  assert_false 'location:leipzig@env=test'.match_p?('location' => 'leipzig', 'env' => 'prod')
  assert_true 'location=leipzig%env=test'.match_p?('location' => 'leipzig', 'env' => 'prod')
  assert_false 'location:leipzig@env=prod'.match_p?('location' => 'leipzig')
  assert_true '%location=halle'.match_p?('location' => 'leipzig')
  assert_true '@location=leipzig'.match_p?('location' => 'leipzig')
  assert_false '%location=leipzig'.match_p?('location' => 'leipzig')
end
