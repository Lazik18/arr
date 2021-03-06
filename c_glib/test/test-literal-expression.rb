# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

class TestLiteralExpression < Test::Unit::TestCase
  def setup
    @scalar = Arrow::BooleanScalar.new(true)
    @datum = Arrow::ScalarDatum.new(@scalar)
    @expression = Arrow::LiteralExpression.new(@datum)
  end

  sub_test_case("==") do
    def test_true
      assert_equal(Arrow::LiteralExpression.new(@datum),
                   Arrow::LiteralExpression.new(@datum))
    end

    def test_false
      assert_not_equal(@expression,
                       Arrow::FieldExpression.new("visible"))
    end
  end

  def test_to_string
    assert_equal("true", @expression.to_s)
  end
end
