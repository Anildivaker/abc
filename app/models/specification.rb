class Specification < ApplicationRecord
    enum context_type: [:dropdown, :text]
    # enum context_type: {
    #     dropdown: 0
    #     text: 1
    # }
end
