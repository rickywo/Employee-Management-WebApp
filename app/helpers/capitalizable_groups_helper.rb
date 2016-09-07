module CapitalizableGroupsHelper

  include JqgridsHelper

  def capitalizable_groups_jqgrid

    options = {:on_document_ready => true, :script_tags => true}

    grid = [{
                :url => '/capitalizable_groups',
                :datatype => 'json',
                :mtype => 'GET',
                :colNames => ['ID#', 'Capitalizable rate %', 'Description'],
                :colModel => [
                    {
                        name: "id",
                        index: "id",
                        width: 100
                    },
                    {
                        name: 'capitalizable_rate',
                        index: "capitalizable_rate",
                        width: 200,
                        editable: true
                    },
                    {
                        name: 'description',
                        index: "description",
                        width: 200,
                        editable: true
                    }],
                :editurl => '/capitalizable_groups/update',
                :pager => '#capitalizable_groups_pager',
                :rowNum => 10,
                :rowList => [10, 20, 30],
                :sortname => 'id',
                :sortorder => 'asc',
                :viewrecords => true,
                :onSelectRow => "function() {&& alert('Row selected!');}".encode,
                :caption => 'Capitalizable Group'
            }]

    # See http://www.trirand.com/jqgridwiki/doku.php?id=wiki:navigator
    # ('navGrid','#gridpager',{parameters}, prmEdit, prmAdd, prmDel, prmSearch, prmView)
    pager = [:navGrid, "#capitalizable_groups_pager", {:edit=> true, :add=> true, :del=> true},{:url => '/capitalizable_groups/update'},{:url => '/capitalizable_groups/create'},{:url => 'capitalizable_groups/destroy/'}, {:closeAfterEdit => true, :closeOnEscape => true}]


    jqgrid_api 'capitalizable_groups_list', grid, pager, options
    #p "function() { alert('Row selected!');}".to_json

  end

end
