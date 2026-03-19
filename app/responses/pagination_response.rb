class PaginationResponse
  def self.paginate(page: int, size: int, total_pages: int, total_items: int, items: [])
    {
      page: page,
      size: size,
      total_pages: total_pages,
      total_items: total_items,
      items: items
    }
  end
end
