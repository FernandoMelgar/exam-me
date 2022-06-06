require_relative "question/question"
require_relative "question/question.interactor"
require "json"
require "aws-sdk-dynamodb"

DYNAMODB = Aws::DynamoDB::Client.new
TABLE_NAME = "Questions"

class HttpStatus
  OK = 200
  CREATED = 201
  BAD_REQUEST = 400
  METHOD_NOT_ALLOWED = 405
end

def make_response(code, body)
  {
    statusCode: code,
    headers: {
      "Content-Type" => "application/json; charset=utf-8",
    },
    body: JSON.generate(body),
  }
end

def make_result_list(items)
  items.map { |item| item.to_json }
end

#--------------------------------------------------------------------
def get_questions
  make_result_list(DYNAMODB.scan(table_name: TABLE_NAME).items)
end

def valid_question?(question)
  return false if question.key?("Question")
  return false if question.key?("Answers")
  @answers = question["Answers"]
  @answers.each do |answer|
    return false if answer.key?("Text")
    return false if answer.key?("Correct")
  end
  return true
end

def parse_body(body)
  return nil if !body
  begin
    data = JSON.parse(body)
    return data if valid_question?(data)
    nil
  rescue JSON::ParserError
    nil
  end
end

#--------------------------------------------------------------------
def store_question(body)
  data = parse_body(body)
  return false if !data
  DYNAMODB.put_item(table_name: TABLE_NAME, item: data)
  true
end

#--------------------------------------------------------------------
def handle_get
  make_response(HttpStatus::OK, get_questions)
end

#--------------------------------------------------------------------
def handle_post
  make_response(HttpStatus::CREATED,
                { message: "Resource created or updated" })
end

#--------------------------------------------------------------------
def handle_bad_request
  make_response(HttpStatus::BAD_REQUEST,
                { message: "Bad request (invalid input)" })
end

#--------------------------------------------------------------------
def handle_bad_method(method)
  make_response(HttpStatus::METHOD_NOT_ALLOWED,
                { message: "Method not supported: #{method}" })
end

#--------------------------------------------------------------------
def lambda_handler(event:, context:)
  method = event["httpMethod"]
  case method
  when "GET"
    handle_get
  when "POST"
    if store_question(event["body"])
      handle_post
    else
      handle_bad_request
    end
  else
    handle_bad_method(method)
  end
end
