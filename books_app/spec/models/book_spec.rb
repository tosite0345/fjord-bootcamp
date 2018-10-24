# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do
  let(:book)   { Book.create(params) }
  let(:params) { { title: "title", author: "author" } }
  describe "record" do
    it "データが有効な状態であること" do
      expect(book).to be_valid
    end
    it "ページネーション機能が動作していること" do
      0.upto(50) { |i| Book.create(params.merge!( title: "title #{i + 1}" )) }
      expect(Book.page(1).count).to eq 10
    end
  end
  describe "title" do
    it "空白でないこと" do
      params[:title] = nil
      expect(book.errors[:title].size).to eq 1
    end
  end
  describe "author" do
    it "空白でないこと" do
      params[:author] = nil
      expect(book.errors[:author].size).to eq 1
    end
  end
end