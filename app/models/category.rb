class Category < ActiveHash::Base
    self.data = [
        { id: 1, name: '--' },
        { id: 2, name: '服' },
        { id: 3, name: '靴' },
        { id: 4, name: '帽子' },
        { id: 5, name: '食べ物' },
        { id: 6, name: '本' },
        { id: 7, name: 'DVD' },
        { id: 8, name: '雑貨' },
        { id: 9, name: 'ゲーム' },
        { id: 10, name: 'その他' }
      ]
end
