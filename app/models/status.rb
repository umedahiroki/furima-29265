class Status < ActiveHash::Base
    self.data = [
        {id: 1, name: '--' },
        {id: 2, name: '良好' },
        {id: 3, name: '傷あり' },
        {id: 4, name: 'ボロボロ' }
    ]
end
