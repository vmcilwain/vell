module JavascriptHelper
  # Basecamp trix uses hidden input to populate its editor
  def fill_in_trix_editor(id, value)
    find(:css, id).set(value)
    # find(:xpath, "//*[@id='#{id}']", visible: false).set(value)
  end
end

# wait.until { driver.find_element(:css => "#HPSearchInput > form > input.ch-  btn.searchBtn").displayed? }
# driver.find_element(:css => "#HPSearchInput > form > input.ch-  btn.searchBtn").
