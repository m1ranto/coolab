module DocumentsHelper
  private
  attr_reader :documents, :document

  def arrows_document(documents, document)
    index = documents.find_index(document)
    previous_document(index.pred) + " " + next_document(index.next) + " " + document_indexes(index)
  end

  def previous_document(index)
    if index >= 0
      link_to "", project_document_path(document.project, documents[index]), class: "bi bi-chevron-up arrow", title: "Navigate up K", data: { controller: "arrow", action: "keydown.k@document->arrow#up" }
    else
      link_to "", "#", class: "bi bi-chevron-up arrow disable"
    end
  end

  def next_document(index)
    if index < documents.size
      link_to "", project_document_path(document.project, documents[index]), class: "bi bi-chevron-down arrow", title: "Navigate down J", data: { controller: "arrow", action: "keydown.j@document->arrow#down" }
    else
      link_to "", "#", class: "bi bi-chevron-down arrow disable"
    end
  end

  def document_indexes(index)
    content_tag :span, "#{index+1}/#{documents.size}", class: "text-secondary ms-1"
  end
end
