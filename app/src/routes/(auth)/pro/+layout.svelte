<script lang="ts">
	import type { MenuItem } from '$lib/types';
	import Header from '$lib/ui/base/Header.svelte';
	import Footer from '$lib/ui/base/Footer.svelte';
	import { baseUrlForRole, homeForRole } from '$lib/routes';
	import { RoleEnum } from '$lib/graphql/_gen/typed-document-nodes';

	const menuItems: MenuItem[] = [
		{ id: 'accueil', path: homeForRole(RoleEnum.Professional), label: 'Accueil' },
		{
			id: 'annuaire',
			path: `${baseUrlForRole(RoleEnum.Professional)}/annuaire`,
			label: 'Annuaire de mes bénéficiaires',
		},
	];
</script>

<Header {menuItems} />

<div class="fr-container fr-py-6w fr-px-1w ">
	<div class="flex flex-col gap-8">
		<slot />
	</div>
</div>

<Footer />
