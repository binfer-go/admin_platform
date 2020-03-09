package help

type SiteAdminCheckFilterWhere interface {

	SiteCheckFilter() interface{}

}

type SiteFilterOptions struct {}

type SiteFilterOption func(options *SiteFilterOptions)


func NewSiteFilter(options ...SiteFilterOption) SiteFilterOptions {

	 option := SiteFilterOptions{}
	 for _, o := range options{
	 	o(&option)
	 }
	 return option

}
