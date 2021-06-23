class Step < ApplicationRecord
  belongs_to :script

  validates :status, inclusion: { in: ['Not-Started', 'On-Hold', 'Passed', 'Failed', 'Not-Run']}

  STATUS_OPTIONS = [
    ['Not Started', 'Not-Started'],
    ['On-Hold', 'On Hold'],
    ['Passed', 'Passed'],
    ['Failed', 'Failed'],
    ['Not-Run', 'Not Run']
  ]
end
