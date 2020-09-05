class ShoppingDatum < ActiveHash::Base
    self.data = [
        {id: 1, name: '--' },
        {id: 2, name: '1日以内' },
        {id: 3, name: '3日以内' },
        {id: 4, name: '5日以内' },
        {id: 5, name: '1週間以内'}
    ]
end
